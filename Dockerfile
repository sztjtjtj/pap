FROM nginx
MAINTAINER jtang "tjtangjian@163.com"

EXPOSE 80

#拉代码
COPY . /usr/share/nginx/html
