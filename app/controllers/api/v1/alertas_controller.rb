module Api
  module V1
    class AlertasController < ApplicationController
      def index
        alertas = Case_Steps_Alerta.order('created_at DESC');
        render json: {status: 'SUCCESS', message:'Loaded alertas', data:alertas},status: :ok
      end

      def show
        alertas = Case_Steps_Alerta.find(params[:id])
        render json: {status: 'SUCCESS', message:'Loaded alertas', data:alertas},status: :ok
      end

      def create
        alertas = Case_Steps_Alerta.new(alertas_params)

        if alertas.save
          render json: {status: 'SUCCESS', message:'Saved alertas', data:alertas},status: :ok
        else
          render json: {status: 'ERROR', message:'Case_Steps_Alerta not saved', data:alertas.errors},status: :unprocessable_entity
        end
      end

      def destroy
        alertas = Case_Steps_Alerta.find(params[:id])
        alertas.destroy
        render json: {status: 'SUCCESS', message:'Deleted alertas', data:alertas},status: :ok
      end

      def update
        alertas = Case_Steps_Alerta.find(params[:id])
        if alertas.update_attributes(alertas_params)
          render json: {status: 'SUCCESS', message:'Updated alertas', data:alertas},status: :ok
        else
          render json: {status: 'ERROR', message:'Case_Steps_Alerta not updated', data:alertas.errors},status: :unprocessable_entity
        end
      end

      private

      def alertas_params
        params.permit(:title, :body)
      end
    end
  end
end
