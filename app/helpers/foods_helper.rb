module FoodsHelper
  def choose_new_or_edit
   if action_name == 'new' || action_name == 'confirm' || action_name == 'create'
     confirm_foods_path
   elsif action_name == 'edit'
     food_path
   end
 end
end
