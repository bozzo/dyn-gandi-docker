#    dyn-gandi-docker
#    Copyright (C) 2021 Boris Barnier <bozzo@users.noreply.github.com>
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <https://www.gnu.org/licenses/>.
FROM appropriate/curl as builder

WORKDIR /app

RUN curl --location https://github.com/Danamir/dyn-gandi/archive/master.zip --output /app/dyn-gandi-master.zip \
    && unzip /app/dyn-gandi-master.zip

# Final image
FROM python:3-alpine

# Add Maintainer Info
LABEL maintainer="Boris Barnier <bozzo@users.noreply.github.com>"

COPY --from=builder /app/dyn-gandi-master /dyn-gandi

WORKDIR /dyn-gandi

RUN pip install -r requirements.txt

VOLUME /etc/dyn-gandi

ENTRYPOINT ["python","dyn_gandi.py","--conf","/etc/dyn-gandi/config.ini"]