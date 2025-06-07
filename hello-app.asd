(defsystem "hello-app"
  :class :package-inferred-system
  :depends-on ("hello-app/hello-app")
  :depends-on (:hunchentoot
               :spinneret
               :lass)
  :build-operation "program-op"
  :build-pathname "hello-app"
  :entry-point "hello-app/hello-app:main")


