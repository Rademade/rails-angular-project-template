class RademadeAdmin::UsersController < RademadeAdmin::ModelController

  options do
    name 'Пользователи'
    list :email
    form do
      first_name
      last_name
      email
      password
      admin
    end
    labels do
      first_name 'Имя'
      last_name 'Фамилия'
      email 'Электронная почта'
      password 'Пароль'
      admin 'Доступ в админку'
    end
  end
  
end
