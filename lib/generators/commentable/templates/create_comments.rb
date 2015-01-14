class <%= migration_class_name %> < ActiveRecord::Migration
  def change
    create_table :<%= table_name %> do |t|
      # t.string :title, :limit => 50, :default => "" 
      t.text :message
      t.references :<%= class_name.demodulize.underscore + "able" %>, polymorphic: true
      t.references :user, polymorphic: true
      t.string :type, default: nil
      t.timestamps
    end

    add_index :<%= table_name %>, [:<%= class_name.demodulize.underscore + "able" %>_type, :<%= class_name.demodulize.underscore + "able" %>_id],
     name: :index_<%= plural_name %>_on_<%= class_name.demodulize.underscore %>able_type_and_<%= class_name.demodulize.underscore %>able_id
    add_index :<%= table_name %>, :user_id
  end
end