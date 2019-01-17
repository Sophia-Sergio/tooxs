import React, { Component } from 'react';
import PropTypes from 'prop-types';
import Select from 'react-select';
import StaffingMonth from './staffing/StaffingMonth';

class StaffingIndex extends Component {
  state = {
    loading: true,
    result: '',
    store: { value: '12', label: 'Alto Las Condes' },
    storeOptions: [
      { value: '12', label: 'Alto Las Condes' }
    ],
    department: { value: '12', label: 'Juvenil mujer' },
    departmentOptions: [
      { value: '12', label: 'Juvenil mujer' }
    ],
    year: { value: '2018', label: '2018' },
    yearOptions: [
      { value: '2018', label: '2018' },
      { value: '2017', label: '2017' },
      { value: '2016', label: '2016' }
    ],
    month: { value: '7', label: 'Julio' },
    monthOptions: [
      { value: '7', label: 'Julio' },
      { value: '6', label: 'Junio' },
      { value: '5', label: 'Mayo' }
    ],
    weeks: [
      {
        dates: ['03', '04', '05', '06', '07', '08', '09'],
        days:[
          {
            day_name: 'L',
            shifts: [
              {
                shift_name: '11:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '12:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '13:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '14:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '15:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '16:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '17:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '18:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '19:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '20:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
            ]
          },
          {
            day_name: 'M',
            shifts: [
              {
                shift_name: '11:00',
                shift_dotation: ['Claudia Bravo Lopez']
              },
              {
                shift_name: '12:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '13:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '14:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '15:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '16:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '17:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '18:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '19:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '20:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
            ]
          },
          {
            day_name: 'M',
            shifts: [
              {
                shift_name: '11:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '12:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '13:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '14:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '15:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '16:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '17:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '18:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '19:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '20:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
            ]
          },
          {
            day_name: 'J',
            shifts: [
              {
                shift_name: '11:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '12:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '13:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '14:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '15:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '16:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '17:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '18:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '19:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '20:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
            ]
          },
          {
            day_name: 'V',
            shifts: [
              {
                shift_name: '11:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '12:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '13:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '14:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '15:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '16:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '17:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '18:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '19:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '20:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
            ]
          },
          {
            day_name: 'S',
            shifts: [
              {
                shift_name: '11:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '12:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '13:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '14:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '15:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '16:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '17:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '18:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '19:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '20:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
            ]
          },
          {
            day_name: 'D',
            shifts: [
              {
                shift_name: '11:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '12:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '13:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '14:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '15:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '16:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '17:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz', 'Claudia Gutierrez']
              },
              {
                shift_name: '18:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina']
              },
              {
                shift_name: '19:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '20:00',
                shift_dotation: ['Ricardo Gonzalez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
            ]
          }
        ]
      },
      {
        dates: ['10', '11', '12', '13', '14', '15', '16'],
        days:[
          {
            day_name: 'L',
            shifts: [
              {
                shift_name: '11:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '12:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '13:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '14:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '15:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '16:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '17:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '18:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '19:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '20:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
            ]
          },
          {
            day_name: 'M',
            shifts: [
              {
                shift_name: '11:00',
                shift_dotation: ['Claudia Bravo Lopez']
              },
              {
                shift_name: '12:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '13:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '14:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '15:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '16:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '17:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '18:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '19:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '20:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
            ]
          },
          {
            day_name: 'M',
            shifts: [
              {
                shift_name: '11:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '12:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '13:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '14:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '15:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '16:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '17:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '18:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '19:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '20:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
            ]
          },
          {
            day_name: 'J',
            shifts: [
              {
                shift_name: '11:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '12:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '13:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '14:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '15:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '16:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '17:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '18:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '19:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '20:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
            ]
          },
          {
            day_name: 'V',
            shifts: [
              {
                shift_name: '11:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '12:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '13:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '14:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '15:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '16:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '17:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '18:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '19:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '20:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
            ]
          },
          {
            day_name: 'S',
            shifts: [
              {
                shift_name: '11:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '12:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '13:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '14:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '15:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '16:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '17:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '18:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '19:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '20:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
            ]
          },
          {
            day_name: 'D',
            shifts: [
              {
                shift_name: '11:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '12:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '13:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '14:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '15:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '16:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '17:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz', 'Claudia Gutierrez']
              },
              {
                shift_name: '18:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina']
              },
              {
                shift_name: '19:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '20:00',
                shift_dotation: ['Ricardo Gonzalez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
            ]
          }
        ]
      },
      {
        dates: ['17', '18', '19', '20', '21', '22', '23'],
        days:[
          {
            day_name: 'L',
            shifts: [
              {
                shift_name: '11:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '12:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '13:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '14:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '15:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '16:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '17:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '18:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '19:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '20:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
            ]
          },
          {
            day_name: 'M',
            shifts: [
              {
                shift_name: '11:00',
                shift_dotation: ['Claudia Bravo Lopez']
              },
              {
                shift_name: '12:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '13:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '14:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '15:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '16:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '17:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '18:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '19:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '20:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
            ]
          },
          {
            day_name: 'M',
            shifts: [
              {
                shift_name: '11:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '12:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '13:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '14:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '15:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '16:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '17:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '18:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '19:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '20:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
            ]
          },
          {
            day_name: 'J',
            shifts: [
              {
                shift_name: '11:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '12:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '13:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '14:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '15:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '16:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '17:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '18:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '19:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '20:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
            ]
          },
          {
            day_name: 'V',
            shifts: [
              {
                shift_name: '11:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '12:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '13:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '14:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '15:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '16:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '17:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '18:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '19:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '20:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
            ]
          },
          {
            day_name: 'S',
            shifts: [
              {
                shift_name: '11:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '12:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '13:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '14:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '15:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '16:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '17:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '18:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '19:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '20:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
            ]
          },
          {
            day_name: 'D',
            shifts: [
              {
                shift_name: '11:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '12:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '13:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '14:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '15:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '16:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '17:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz', 'Claudia Gutierrez']
              },
              {
                shift_name: '18:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina']
              },
              {
                shift_name: '19:00',
                shift_dotation: ['Ricardo Gonzalez', 'Claudia Bravo Lopez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
              {
                shift_name: '20:00',
                shift_dotation: ['Ricardo Gonzalez', 'Juan Herrera', 'Ulises Medina', 'Rodrigo Sanz']
              },
            ]
          }
        ]
      },
    ],
  }
  render () {
    const { store, storesOptions, department, departmentOptions, year, yearOptions, month, monthOptions, weeks } = this.state;
    console.log(weeks[0].days[0].shifts);

    return (
      <React.Fragment>
        <div className="col-12 mb-2">
          <div className="card dashboard__filter">
            <form onSubmit={this.handleSubmit}>
              <div className="form-group">
                <Select
                  noOptionsMessage={() => 'No se econtraron más opciones'}
                  onChange={this.storeChange}
                  options={storesOptions}
                  placeholder={`Tienda`}
                  value={store}
                />
              </div>
              <div className="form-group">
                <Select
                  noOptionsMessage={() => 'No se econtraron más opciones'}
                  onChange={this.departmentChange}
                  options={departmentOptions}
                  placeholder={`Departamento`}
                  value={department}
                />
              </div>
              <div className="form-group">
                <Select
                  noOptionsMessage={() => 'No se econtraron más opciones'}
                  onChange={this.yearChange}
                  options={yearOptions}
                  placeholder={`Año`}
                  value={year}
                />
              </div>
              <div className="form-group">
                <Select
                  noOptionsMessage={() => 'No se econtraron más opciones'}
                  onChange={this.monthChange}
                  options={monthOptions}
                  placeholder={`Mes`}
                  value={month}
                />
              </div>
              <button className="btn btn-primary" type="submit">Buscar</button>
            </form>
          </div>
        </div>
        <div className="col-12 mb-2">
          <div className="card dashboard__chart">
            <h5 className="card-title">Resultado de búsqueda</h5>
          </div>
        </div>
        {weeks.map((week, index) => (
          <StaffingMonth
            week_name={`Semama ${ index + 1 }`}
            week={week}
          />
        ))}
      </React.Fragment>
    );
  }
}

export default StaffingIndex