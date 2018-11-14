# frozen_string_literal: true

# Parameters used for demo only
module DemoParameters
  extend ActiveSupport::Concern

  def demo_data
    {
      department: 1,
      store: 1,
      search: '',
      date: Date.new(2018, 6, 24),
      cluster: 1,
      month: 6,
      year: 2018,
      target_productivity: 85000
    }
  end

  def staff_planification
    [
      {
        name: 'Ricardo Gonzalez',
        rut: '12.222.008-7',
        store: 'Alto Las Condes',
        department: 'Juvenil mujer',
        shift: 'T1',
        shift_desc: 'TURNO 1 DE 45 HORAS',
        new_shift: 'T1',
        new_shift_desc: 'TURNO 1 DE 45 HORAS'
      },
      {
        name: 'Carlos Paz',
        rut: '16.599.858-8',
        store: 'Alto Las Condes',
        department: 'Juvenil mujer',
        shift: 'T1',
        shift_desc: 'TURNO 1 DE 45 HORAS',
        new_shift: '',
        new_shift_desc: ''
      },
      {
        name: 'Claudia Andrea Bravo Lopez',
        rut: '18.004.462-0',
        store: 'Alto Las Condes',
        department: 'Juvenil mujer',
        shift: 'T2',
        shift_desc: 'TURNO 2 DE 45 HORAS',
        new_shift: 'T2',
        new_shift_desc: 'TURNO 2 DE 45 HORAS'
      },
      {
        name: 'Juan Herrera',
        rut: '11.692.224-K',
        store: 'Alto Las Condes',
        department: 'Juvenil mujer',
        shift: 'T2',
        shift_desc: 'TURNO 2 DE 45 HORAS',
        new_shift: '',
        new_shift_desc: ''
      },
      {
        name: 'Ulises Medina',
        rut: '19.395.784-6',
        store: 'Alto Las Condes',
        department: 'Juvenil mujer',
        shift: 'T3',
        shift_desc: 'TURNO 3 DE 45 HORAS',
        new_shift: 'T3',
        new_shift_desc: 'TURNO 3 DE 45 HORAS'
      },
      {
        name: 'Rodrigo Sanz',
        rut: '12.637.373-2',
        store: 'Alto Las Condes',
        department: 'Juvenil mujer',
        shift: 'T3',
        shift_desc: 'TURNO 3 DE 45 HORAS',
        new_shift: '',
        new_shift_desc: ''
      },
      {
        name: 'Margarita Cuevas',
        rut: '13.619.919-6',
        store: 'Alto Las Condes',
        department: 'Juvenil mujer',
        shift: 'T4',
        shift_desc: 'TURNO 4 DE 45 HORAS',
        new_shift: 'T4',
        new_shift_desc: 'TURNO 4 DE 45 HORAS'
      },
      {
        name: 'Antonio Brown',
        rut: '16.853.640-2',
        store: 'Alto Las Condes',
        department: 'Juvenil mujer',
        shift: 'T4',
        shift_desc: 'TURNO 4 DE 45 HORAS',
        new_shift: '',
        new_shift_desc: ''
      },
      {
        name: 'Pedro Silva',
        rut: '13.077.844-5',
        store: 'Alto Las Condes',
        department: 'Juvenil mujer',
        shift: 'T5',
        shift_desc: 'TURNO 1 DE 36 HORAS',
        new_shift: 'T5',
        new_shift_desc: 'TURNO 1 DE 36 HORAS'
      },
      {
        name: 'Javiera Ruiz',
        rut: '16.423.245-K',
        store: 'Alto Las Condes',
        department: 'Juvenil mujer',
        shift: 'T5',
        shift_desc: 'TURNO 1 DE 36 HORAS',
        new_shift: 'T5',
        new_shift_desc: 'TURNO 1 DE 36 HORAS'
      },
      {
        name: 'Pablo Jara',
        rut: '19.686.769-4',
        store: 'Alto Las Condes',
        department: 'Juvenil mujer',
        shift: 'T6',
        shift_desc: 'TURNO 2 DE 45 HORAS',
        new_shift: '',
        new_shift_desc: ''
      },
      {
        name: 'Alejandra Fuentes',
        rut: '8.434.840-3',
        store: 'Alto Las Condes',
        department: 'Juvenil mujer',
        shift: 'T6',
        shift_desc: 'TURNO 2 DE 45 HORAS',
        new_shift: '',
        new_shift_desc: ''
      },
      {
        name: 'Juan Pablo Garcia',
        rut: '8.658.424-7',
        store: 'Alto Las Condes',
        department: 'Juvenil mujer',
        shift: 'T9',
        shift_desc: 'TURNO 1 DE 24 HORAS',
        new_shift: '',
        new_shift_desc: ''
      },
      {
        name: 'Luis Sanchez',
        rut: '16.999.197-9',
        store: 'Alto Las Condes',
        department: 'Juvenil mujer',
        shift: 'T10',
        shift_desc: 'TURNO SÁBADO',
        new_shift: 'T10',
        new_shift_desc: 'TURNO SÁBADO - DOMINGO'
      },
      {
        name: 'Ricardo Urrutia',
        rut: '17.034.487-1',
        store: 'Alto Las Condes',
        department: 'Juvenil mujer',
        shift: 'T10',
        shift_desc: 'TURNO SÁBADO',
        new_shift: 'T10',
        new_shift_desc: 'TURNO SÁBADO - DOMINGO'
      },
      {
        name: 'Mauricio Martinez',
        rut: '13.953.401-8',
        store: 'Alto Las Condes',
        department: 'Juvenil mujer',
        shift: 'T11',
        shift_desc: 'TURNO 1 TARDE',
        new_shift: 'T11',
        new_shift_desc: 'TURNO 1 TARDE'
      },
      {
        name: 'Francisco Lillo',
        rut: '12.095.259-5',
        store: 'Alto Las Condes',
        department: 'Juvenil mujer',
        shift: 'T1',
        shift_desc: 'TURNO 1 DE 45 HORAS',
        new_shift: 'T1',
        new_shift_desc: 'TURNO 1 DE 45 HORAS'
      },
    ]
  end
  def shift_available
    [
      {
        shift: 'T7',
        desc: 'TURNO 3 de 36',
        quantity: 1
      },
      {
        shift: 'T10',
        desc: 'TURNO SÁBADO - DOMINGO',
        quantity: 3
      },
      {
        shift: 'T11',
        desc: 'TURNO 1 TARDE',
        quantity: 1
      },
      {
        shift: 'T12',
        desc: 'TURNO 2 TARDE',
        quantity: 1
      }
    ]
  end

  def shift_optimized
    [
      {
        shift: 'T1',
        actual: 3,
        optimized: 1,
        committed: 1,
        to_cover: 0
      },
      {
        shift: 'T2',
        actual: 3,
        optimized: 1,
        committed: 1,
        to_cover: 0
      },
      {
        shift: 'T3',
        actual: 3,
        optimized: 1,
        committed: 1,
        to_cover: 0
      },
      {
        shift: 'T4',
        actual: 2,
        optimized: 1,
        committed: 1,
        to_cover: 0
      },
      {
        shift: 'T5',
        actual: 2,
        optimized: 2,
        committed: 2,
        to_cover: 0
      },
      {
        shift: 'T6',
        actual: 2,
        optimized: 0,
        committed: 0,
        to_cover: 0
      },
      {
        shift: 'T7',
        actual: 0,
        optimized: 1,
        committed: 0,
        to_cover: 0
      },
      {
        shift: 'T8',
        actual: 0,
        optimized: 0,
        committed: 0,
        to_cover: 0
      },
      {
        shift: 'T9',
        actual: 1,
        optimized: 0,
        committed: 0,
        to_cover: 0
      },
      {
        shift: 'T10',
        actual: 2,
        optimized: 5,
        committed: 2,
        to_cover: 3
      },
      {
        shift: 'T11',
        actual: 1,
        optimized: 2,
        committed: 1,
        to_cover: 1
      },
      {
        shift: 'T12',
        actual: 1,
        optimized: 2,
        committed: 1,
        to_cover: 1
      },
    ]
  end

end
