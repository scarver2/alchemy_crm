module AlchemyCrm
	class MailingsController < AlchemyCrm::BaseController

		#layout :layout_for_page

		def show
			@mailing = Mailing.find_by_sha1(params[:m])
			if @mailing.nil? && !params[:id].blank?
				@mailing = Mailing.find(params[:id])
			end
			@page = @mailing.page
			if params[:r].present?
				@recipient = @mailing.recipients.find_by_sha1(params[:r])
			end
			@contact = @recipient ? @recipient.contact || Contact.new_from_recipient(@recipient) : Contact.fake
		end

	end
end
