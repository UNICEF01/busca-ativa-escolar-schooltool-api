module Api
  module V1
    class AlertasController < ApplicationController
      def index
        yearparam = params[:year]
        schoolid = params[:school_last_id]
        year = yearparam ? " and c.educacenso_year = " + yearparam : ''

        sql = "SELECT csa.id, csa.name, csa.mother_name, c.educacenso_year, csa.place_address, csa.place_reference, csa.place_cep, csa.place_neighborhood FROM case_steps_alerta csa
        join case_steps_pesquisa csp on csa.child_id = csp.child_id
        join children c on c.id = csa.child_id
        where csp.school_last_id = " + schoolid

        if yearparam
          sql = sql + year
        end

        alertas = Case_Steps_Alerta.find_by_sql(sql)
        render json: {status: 'SUCCESS', message: 'Loaded alertas', data: alertas}, status: :ok
      end

      def show
        alertas = Case_Steps_Alerta.find(params[:id])
        render json: {status: 'SUCCESS', message: 'Loaded alertas by iD', data: alertas}, status: :ok
      end

      def create
        alertas = Case_Steps_Alerta.new(alertas_params)

        if alertas.save
          render json: {status: 'SUCCESS', message: 'Saved alerta', data: alertas}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Case_Steps_Alerta not saved', data: alertas.errors}, status: :unprocessable_entity
        end
      end

      def destroy
        alertas = Case_Steps_Alerta.find(params[:id])
        alertas.destroy
        render json: {status: 'SUCCESS', message: 'Deleted alertas', data: alertas}, status: :ok
      end

      def update
        alerta = Case_Steps_Alerta.find(params[:id])
        if alerta.update_attributes(alertas_params)
          render json: {status: 'SUCCESS', message: 'Alerta atualizado', data: alerta}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Case_Steps_Alerta not updated', data: alertas.errors}, status: :unprocessable_entity
        end
      end

      private

      def alertas_params
        params.permit(:place_cep, :place_address, :place_reference, :place_neighborhood)
      end
    end
  end
end
