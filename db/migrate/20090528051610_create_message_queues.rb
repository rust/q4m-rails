class CreateMessageQueues < ActiveRecord::Migration
  def self.up
    create_table :message_queues, :id => false, :options => "ENGINE=QUEUE" do |t|
      t.integer :id,      :null => false
      t.string  :message, :null => false
    end
  end

  def self.down
    drop_table :message_queues
  end
end
