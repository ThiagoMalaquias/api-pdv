module Api::V1
 class CategoriasController<ApplicationController
    def index
      if params[:empresa_id].present?
        categoria = Categoria.where(empresa_id: params[:empresa_id]).first
        categoria = categoria.to_json
        render json: categoria, status: 200
      elsif params[:id].present?
        categoria = Categoria.where(id:params[:id]).first
        categoria  = categoria.to_json
        render json: categoria, status: 200
      else
        render json: Categoria.all
      end
    end

    def create
      categoria = Categoria.new(categoria_params)
      if categoria.save()
        render json: categoria, status: 200
      else
        render json: { errors: categoria.errors.full_messages}, status: 400
      end
    end

    def update
      categoria = Categoria.find(params[:id])
      if categoria.update(categoria_params)
        render json: categoria, status: 200
      else
        render json: { errors: categoria.errors.full_messages}, status: 400
      end
    end

    def destroy
      categoria = Categoria.find(params[:id])
      if categoria.destroy
        render json: categoria, status: 200
      else
        render json: { errors: categoria.errors.full_messages}, status: 400
      end
    end

    private

    def categoria_params
      params.require(:categoria).permit(:nome, :empresa_id)
    end
  end
end