Rails.application.routes.draw do
  get("/users", { :controller => "users", :action => "index" })

  get("/users/:username", { :controller => "users", :action => "show"}) 

  get("/photos", { :controller => "photos", :action => "index" })

  get("/photos/:path_id", { :controller => "photos", :action => "show" })

  get("/delete_photo/:path_id", { :controller => "photos", :action => "delete"})

  get("/insert_photo", { :controller => "photos", :action => "insert_photo" })

  get("/update_photo/:path_id", { :controller => "photos", :action => "update" })

  get("/", { :controller => "users", :action => "index" })

  get("/update_user/:path_id", { :controller => "users", :action => "update" })

end
