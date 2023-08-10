# fireboom-docker
此仓库是构建docker镜像需要的最小的依赖
Docker部署
当前Docker镜像支持开发模式dev和生产模式start。
开发模式内置了golang和nodejs环境；
生产模式提供了飞布运行所必须得环境；
使用方法
1. 构建镜像
#拉取镜像
docker build -t fireboom_server:latest .
2. 运行容器
以开发模式启动，不可用于正式环境！
# 1，前往工作目录
cd workspace
# 2，以挂载目录的方式运行容器
docker run -it -v $(pwd)/store:/fbserver/store \
		-v $(pwd)/upload:/fbserver/upload \
		-v $(pwd)/template:/fbserver/template \
		-v $(pwd)/exported:/fbserver/exported \
		-v $(pwd)/custom-go:/fbserver/custom-go \
		-v $(pwd)/custom-ts:/fbserver/custom-ts \
		-p 9123:9123 -p 9991:9991 \
		 fireboomapi/fireboom_server:latest dev 
若是windows系统，请将 $(pwd) 替换为${pwd}
以生产模式启动
docker run -it -p 9123:9123 -p 9991:9991 fireboom_server:latest start 
挂载目录
容器的工作目录为：./fbserver，根据需求挂载下述子目录。
存储目录： store、upload、exported
钩子目录：custom-go 或 custom-ts  （不用钩子，无需暴露）
日志目录（可选）：log
端口说明
9123：飞布控制台的端口
9991：飞布处理所有api请求的端口
3. 使用Fireboom
访问地址：
