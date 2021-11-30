<?php

namespace App\Models\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Alerta extends Model
{   
    protected $table = "case_steps_alerta";

    protected $fillable = [
     
    'id',
    'name',
    'gender',
    'race',
    'dob',
    'rg',
    'cpf',
    'nis',
    'cns',
    'alert_cause_id',
    'alert_status',
    'mother_name',
    'mother_rg',
    'mother_phone',
    'father_name',
    'father_rg',
    'father_phone',
    'place_address',
    'place_cep',
    'place_reference',
    'place_neighborhood',
    'place_city_id',
    'place_city_name',
    'place_uf',
    'place_phone',
    'place_mobile',
    'place_lat',
    'place_lng',
    'place_map_region',
    'place_map_geocoded_address',
    'observation'
    ];

  
}
