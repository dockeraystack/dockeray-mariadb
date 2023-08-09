#
# Copyright © 2022 Thiago Moreira (tmoreira2020@gmail.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

FROM mariadb:10.11.4

ARG TARGETARCH

COPY dockerize-linux-$TARGETARCH-v0.6.1.tar.gz /tmp/dockerize.tar.gz

RUN apt-get update \
    && apt-get install -y wget \
    && rm -rf /var/lib/apt/lists/* \
    && tar -C /usr/local/bin -xzvf /tmp/dockerize.tar.gz \
    && rm /tmp/dockerize.tar.gz \
    && rm -rf /tmp/* /var/cache/apk/* 

ADD custom.cnf /etc/mysql/conf.d/custom.cnf
ADD 1-pre-custom-sql.sh /docker-entrypoint-initdb.d/
ADD 5-add-reload-privileges.sh /docker-entrypoint-initdb.d/
ADD 9-post-custom-sql.sh /docker-entrypoint-initdb.d/

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

CMD ["mariadbd"]