# encoding: UTF-8
module AlchemyCrm
  module Admin
    class MailingsController < AlchemyCrm::Admin::BaseController

      before_filter :load_newsletters, :only => [:new, :edit, :copy]

      helper 'AlchemyCrm::Mailings'
      helper 'Alchemy::Admin::Pages'

      def copy
        @mailing = Mailing.copy(params[:id])
        render :action => :new, :layout => false
      end

      def show
        @mailing = Mailing.find(params[:id])
        @page = @mailing.page
        @contact = Contact.fake
        @recipient = Recipient.new_from_contact(@contact)
        @preview_mode = true
        render :layout => 'alchemy_crm/mailings'
      end

      def edit_content
        @mailing = Mailing.find(params[:id])
        @page = @mailing.page
      end

      def update
        @mailing.update_attributes(params[:mailing])
        render_errors_or_redirect(
          @mailing,
          :back,
          flash_notice_for_resource_action
        )
      end

    private

      def load_newsletters
        @newsletters = Newsletter.all
      end

    end
  end
end
