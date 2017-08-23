FROM ubuntu:14.04

WORKDIR /root/psnr

RUN apt-get update && apt-get install -y wget build-essential libavcodec-dev libavformat-dev libswscale-dev

COPY ./psnr /root/psnr

RUN make

ENV VIDEO1 /root/psnr/test1.mp4
ENV VIDEO2 /root/psnr/test2.mp4

CMD /root/psnr/qpsnr -s 0 -m 1000 -r $VIDEO1 $VIDEO2
