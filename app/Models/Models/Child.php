<?php

namespace App\Models\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class Child extends Model
{
    
    protected $table = "children";

    protected $fillable = [
        'name',
        'tenant_id',
        'city_id',
        'mother_name',
        'father_name',
        'risk_level',
        'gender',
        'age',
        'alert_submitter_id',
        'alert_status',
        'current_case_id',
        'current_step_type',
        'current_step_id',
        'deadline_status',
        'child_status',
        'lat',
        'lng',
        'map_region',
        'map_geocoded_address',
        'educacenso_id',
        'educacenso_year',
        'father_id'
    ];

    public function pesquisa()
    {
        return $this->hasOne('App\Models\Models\Pesquisa', 'child_id', 'id');
    }

}
