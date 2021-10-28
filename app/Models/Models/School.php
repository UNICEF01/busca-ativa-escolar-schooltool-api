<?php

namespace App\Models\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class School extends Model
{
    protected $table = "schools";

	protected $fillable = [
		'id',
		'name',
		'uf',
		'uf_id',
		'region',
		'city_id',
		'city_name',
		'city_ibge_id',
		'metadata',
        'school_cell_phone',
        'school_phone',
        'school_email',
        'token',
        'periodicidade'
	];
    
}
