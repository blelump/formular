require "test_helper"

class HelperTest < Minitest::Spec 

  CommentCell = Class.new do
    include Formular::Helper
  end

  describe "#form" do
    describe "default builder" do
      let(:cell) { CommentCell.new }
      let(:model) { Comment.new(nil, "Amazing!") }

      it "renders empty form" do
        cell.form(nil, model: model) { }.must_eq %{<form action="" method="post" />}
      end

      it "renders fields with prefix path" do
        cell.form(nil, model: model, path: %w(comment)) do |f|
          f.input :body
        end.must_eq %{<form action="" method="post"><input type="text" name="comment[body]" id="form_body" value="Amazing!" /></form>}
      end

      it "" do
        cell.form("create", {model: model}, method: :get) {}.must_eq %{<form action="create" method="get" />}
      end
    end
  end

end
