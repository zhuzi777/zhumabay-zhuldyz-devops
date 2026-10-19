FROM alpine:3.20
WORKDIR /app
COPY app/app.sh /app/app.sh
COPY Zhumabay_Zhuldyz_info.txt /app/Zhumabay_Zhuldyz_info.txt
RUN chmod +x /app/app.sh
ENV STUDENT_NAME=Zhuldyz \
    STUDENT_SURNAME=Zhumabay \
    STUDENT_GROUP=IT2-2308 \
    STUDENT_ID=37947
EXPOSE 8080
CMD ["/app/app.sh"]
