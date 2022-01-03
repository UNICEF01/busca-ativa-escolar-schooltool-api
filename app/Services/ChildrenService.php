<?php

namespace App\Services;

use App\Interfaces\IChildren;
use App\Models\Models\School;
use InvalidArgumentException;

class ChildrenService implements IChildren
{
    protected $childRepository;

    public function __construct(ChildRepository $childRepository){
        $this->childRepository = $childRepository;
    }


    public function getAll(array $attributes): object
    {
        $validator = Validator::make($attributes, [
            'school_last_id' => 'required',
            'token' => 'required',
        ])

        if ($validator->fails()) {
            throw new InvalidArgumentException($validator->errors()->first());
        }

        $school = School::where([
            ['token', '=', $attributes['token']],
            ['id', '=', $attributes['idescola']]
        ])->get()->first();
        
        if($school)
            $children = $this->childRepository->findAll(intval($attributes['school_last_id']));
        else
            throw new InvalidArgumentException('Unable to found children data');

        return [$children, $school];

    }
}
