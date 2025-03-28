<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Usuario extends Model
{
    use HasFactory;
    protected $table = 'usuarios';

    protected $primaryKey = 'id';
    public $timestamps = false; 
    protected $fillable = ['sesion_iniciada'];
}
