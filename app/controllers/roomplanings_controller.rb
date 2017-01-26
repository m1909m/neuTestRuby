class RoomplaningsController < InheritedResources::Base

  private

    def roomplaning_params
      params.require(:roomplaning).permit(:week, :monday, :tuesday, :wednesday, :thursday, :friday)
    end
end

