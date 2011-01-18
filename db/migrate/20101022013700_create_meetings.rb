class CreateMeetings < ActiveRecord::Migration
  def self.up
    create_table :meetings do |t|
      t.timestamp :meeting_at
      t.text :topic
      t.string :title
      t.belongs_to :place

      t.timestamps
    end
  end

  def self.down
    drop_table :meetings
  end
end
