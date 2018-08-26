Rails.application.routes.draw do
  resources :cat_protections
  get 'comment_moms/create'

  get 'comment_moms/destroy'

  resources :moms
  resources :boards
  
  resources :cat_infos do
   member do
    put 'like', to: "cat_infos#like"
    put 'unlike', to: "cat_infos#unlike"
  end
end

  devise_for :users
  
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
 root'pages#home'
 
 get'/pages' => 'pages#home'
 
 get '/abandoned' => 'pages#abandoned'
  
  get'/boards'=>'boards#index'#고양이찾기
  get'/cat_protections'=>'cat_protections#index'#시설정보
  get'/moms'=>'moms#index'#캣맘게시판
    #get'/homes'=>'homes#index'#유기묘공고
    
    #Comment
  #Create
  post '/comment_moms' => 'comment_moms#create'
  
  #Destroy
  delete '/comment_moms/:id' => 'comment_moms#destroy'
  
  get '/region/:region' => 'moms#index'
  
end
