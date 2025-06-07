(defpackage :hello-app/hello-app
  (:use :cl :hunchentoot :spinneret :lass)
  (:export :main))

(in-package :hello-app/hello-app)


(defparameter *css*
  '((body
     :background-color "#23c4cc")))


(defun start-server ()
  (defparameter *server* (make-instance 'tbnl:easy-acceptor
                                        :port 3333
                                        :address  "0.0.0.0"))
  (tbnl:start *server*)
  (tbnl:define-easy-handler (main :uri "/")
      (name)
    (spinneret:with-html-string
      (:html
       (:head
        (:style
         (apply #'lass:compile-and-write *css*)))
       (:body
        (:div :class "wrapper"
              (:h1 "Hello Page")
              (if name
                  (:p (format nil "Hi, ~A" name)) 
                  (:p "No name :("))))))))


(defun main ()
  (start-server)
  (loop while t do (sleep 60)))
