class DaysController < ApplicationController
    def index
        @query = Day.where( ["date >= ?", Date.today] ).order( "date ASC" )[0..6]
       
        @days = []
 
        for i in 0..@query.length-1 do
          
            @days << @query[i]

            # if there can be a gap between this element and next
            if i != @query.length-1
                if @query[i].date != @query[i+1].date - 1
                    @days << nil
                end
            end
        end
    end

    def show
        @day = Day.find(params[:id])
    end
    def new
        @day = Day.new 
    end
    
    def create
       y = params[:post_date][6..9].to_i
       m = params[:post_date][3..4].to_i
       d = params[:post_date][0..1].to_i
       @day = Day.new
       @day.date = DateTime.new(y, m, d) 
       @day.save 
       redirect_to :days 
    end    
end
