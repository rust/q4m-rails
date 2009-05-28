require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe MessageQueue, "の" do
  before(:each) do
    MessageQueue.delete_all
  end

  describe "push で" do
    it "引数に String を与えるとそのメッセージが追加されること" do
      str = "hoge"
      MessageQueue.push(str)
      MessageQueue.find(:first, :conditions => {:message => str}).message.should == str
    end

    it "引数に Numeric を与えるとそのメッセージが追加されること" do
      numeric = 234
      MessageQueue.push(numeric)
      MessageQueue.find(:first, :conditions => {:message => numeric}).message.should == numeric.to_s
    end

    it "引数に Array を与えると，その内容が保存されること" do
      array = ["hoge", "foo", "bar", 123456, 234567, 345678]
      lambda {
        MessageQueue.push(array)
      }.should change(MessageQueue, :count).by(array.size)
    end
  end

  describe "pop で" do
    it "1つの message を得られること" do
      str = "hogehoge"
      MessageQueue.push(str)
      lambda {
        MessageQueue.pop do |message|
          message.should == str
        end
      }.should change(MessageQueue, :count).by(-1)
    end

    it "連続で取得しようとするとエラーが発生すること" do
      MessageQueue.push("hogehoge1")
      MessageQueue.push("hogehoge2")

      MessageQueue.pop do |message|
        lambda {
          MessageQueue.pop do |message2|
          end
        }.should raise_error
      end
    end
  end
end
