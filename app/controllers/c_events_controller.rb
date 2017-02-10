class CEventsController < InheritedResources::Base

  private

    def c_event_params
      params.require(:c_event).permit(:title, :start, :end, :color, :description)
    end
end

