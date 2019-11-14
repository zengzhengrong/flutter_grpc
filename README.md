[中文](https://github.com/zengzhengrong/flutter_grpc/blob/master/README_zh.md)

# flutter_grpc 

Flutter with grpc tutorial ~!

## Features
 - bloc(state management)
 - grpc(high-performance micro service)

## Docker deploy micro-service(grpc)

If installed docker on your machine , it's very easy to deploy  
Change directory to example/< projectname >/*_api by counter example:
```
cd examples/counter/counter_api
```
Build image
```
docker build -t counter_grpc .
```
Run on docker
```
docker run -d --name counter-container -p "50051:50051" counter_grpc
```

Check service working 
```
docker logs counter-container
```
If not installed docker ,you also use my service see below(Not long-term support)

edit */src/client.dart
```
channel = ClientChannel('localhost',port: 50051,
                        ...
```
replace localhost and port
## counter

```
ip_address : 47.106.195.247
port : 5005
```
The article come soon ~!
