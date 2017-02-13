class MembersController < InheritedResources::Base

  private

    def member_params
      params.require(:member).permit(:gender, :firstName, :lastName, :street, :plz, :place, :job, :phone, :eMail, :sleep, :room, :nameCompany, :streetCompany, :placeCompany, :veggie, :accept, :event_id)
    end
end

