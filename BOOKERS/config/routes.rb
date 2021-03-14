Rails.application.routes.draw do
  # rails 3章
  get 'books/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  # rails 2章
  get 'top' => 'homes#top'

  # rails 4章
  post 'books' => 'books#create'

  #rails 5章
  get 'books/new' => 'books#index'

  # rails5章 id
  # .../todolists/1 や .../todolists/3 に該当する
  get 'books/new/:id' => 'books#show', as: 'book'

  # rails6章 編集機能
  get 'books/new/:id/edit' => 'books#edit', as: 'edit_book'

  # rails6章 編集機能db更新
  patch 'books/new/:id' => 'books#update', as: 'update_book'
  
end
