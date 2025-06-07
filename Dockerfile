FROM fukamachi/sbcl
WORKDIR /hello-app
COPY . /hello-app

RUN CL_SOURCE_REGISTRY=`pwd`/ ros run --load build.lisp

EXPOSE 3333

ENTRYPOINT ["/hello-app/hello-app"]
