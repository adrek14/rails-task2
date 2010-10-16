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

       day.create()
       redirect_to days 
    end    
end
