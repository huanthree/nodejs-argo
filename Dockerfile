# 1️⃣ 选择轻量级 Node.js 镜像
FROM node:slim

# 2️⃣ 设置工作目录
WORKDIR /app

# 3️⃣ 先复制 package.json 和 package-lock.json（优化缓存）
COPY package*.json ./

# 4️⃣ 仅安装生产环境依赖（加快构建速度）
RUN apt update -y && \
    npm ci --only=production

# 5️⃣ 复制其他文件
COPY . .

# 6️⃣ 赋予执行权限
RUN chmod +x index.js

# 7️⃣ 声明端口
EXPOSE 3000

# 8️⃣ 运行应用
CMD ["node", "index.js"]
