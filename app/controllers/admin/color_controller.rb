module Admin
  class ColorController < BaseController
    before_action :verify_admin

    def edit
      @color = $redis.get('current_day_color')
    end

    def update
      unless params[:color] == 'No Color'
        $redis.set('current_day_color', params[:color])
      else
        $redis.del('current_day_color')
      end
      redirect_to admin_color_path, notice: 'Day color updated.'
    end

    private
    def verify_admin
      authorize :admin_panel, :color
    end

  end
end