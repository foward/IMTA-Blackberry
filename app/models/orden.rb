class Orden < ActiveRecord::Base


    # Tipo de Orden
  PREDICTIVO = 0.freeze
  CORRECTIVO = 1.freeze
  GARANTIA = 2.freeze


  TIPO_ORDEN = [
    [ "Mantención Predictiva", PREDICTIVO ],
    [ "Mantención Correctiva", CORRECTIVO ],
    [ "Garantía", GARANTIA ]
  ].freeze

      # Estado de Orden
  INICIADO = 0.freeze
  EN_PROCESO = 1.freeze
  ESPERA_REPUESTOS = 2.freeze
  ESPERA_APROBACION_PRESUPUESTO = 3.freeze
  PERSONALIZADO= 4.freeze
  FINALIZADO = 5.freeze


  ESTADO = [
    [ "Iniciado", INICIADO ],
    [ "En proceso", EN_PROCESO ],
    [ "En espera de repuestos", ESPERA_REPUESTOS ],
    [ "Espera Aprobación Presupuesto", ESPERA_APROBACION_PRESUPUESTO ],
    [ "Personalizado", PERSONALIZADO ],
    [ "Finalizado", FINALIZADO ]
  ].freeze


end
