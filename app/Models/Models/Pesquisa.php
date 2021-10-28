<?php

namespace App\Models\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pesquisa extends Model
{   
    protected $table = "case_steps_pesquisa";

    protected $fillable = [
		'tenant_id',
		'child_id',
		'case_id',
		'step_type',
		'step_index',
		'next_index',
		'next_type',
		'assigned_user_id',
		'assigned_group_id',
		'is_pending_assignment',
		'completed_at',
		'started_at',
		'is_completed',
        'name',
        'gender',
        'race',
        'dob',
        'rg',
        'cpf',
        'cns',
        'has_been_in_school',
        'reason_not_enrolled',
        'school_last_grade',
        'school_last_year',
        'school_last_id',
        'school_last_name',
        'school_last_status',
        'school_last_age',
        'school_last_address',
        'is_working',
        'work_activity',
        'work_activity_other',
        'work_is_paid',
        'work_weekly_hours',
        'parents_has_mother',
        'parents_has_father',
        'parents_has_brother',
        'parents_has_others',
        'parents_has_grandparents',
        'parents_who_is_guardian',
        'parents_income',
        'mother_name',
        'guardian_name',
        'guardian_rg',
        'guardian_cpf',
        'guardian_dob',
        'guardian_phone',
        'guardian_race',
        'guardian_schooling',
        'guardian_job',
        'case_cause_ids',
        'handicapped_at_sus',
        'handicapped_reason_not_enrolled',
        'place_address',
        'place_cep',
        'place_reference',
        'place_neighborhood',
        'place_city_id',
        'place_city_name',
        'place_uf',
        'place_kind',
        'place_is_quilombola',
        'place_lat',
        'place_lng',
        'place_map_region',
        'place_map_geocoded_address',
        'aux',
        'nis'
	];

    public function school()
    {
        return $this->hasOne('App\Models\Models\School', 'id', 'school_last_id');
    }

    public function child(){
        return $this->belongsTo('App\Models\Models\Child', 'id', 'child_id');
    }

}
