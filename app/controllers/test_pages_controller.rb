class TestPagesController < ApplicationController
  def test_page
  end

  def test_format
    respond_to do |format|
      format.js
      format.json { render json: {
        text: 'respond_to json!',
        name: 'lzh'
        }
      }
    end
  end
end
