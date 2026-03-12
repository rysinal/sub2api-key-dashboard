FROM nginx:alpine

# 复制 nginx 配置模板
COPY nginx.conf /etc/nginx/nginx.conf.template

# 复制 HTML 文件
COPY index.html /usr/share/nginx/html/index.html

# 暴露端口
EXPOSE 11080

# 启动脚本：替换环境变量并启动 nginx
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/bin/sh", "/entrypoint.sh"]
