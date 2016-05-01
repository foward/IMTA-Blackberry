module OrdensHelper


    def estado_orden(st)
    if st == "0"
      return "Iniciado"
    end
    if st == "1"
      return "En proceso"
    end
    if st == "2"
      return "En espera de repuestos"
    end
     if st == "3"
      return "Espera Aprobación Presupuesto"
    end
    if st == "4"
      return "Personalizado"
    end
    if st == "5"
      return "Finalizado"
    end
  end
end
