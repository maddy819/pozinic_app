<?php

namespace App\Exports;

use App\User;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class UserExport implements FromCollection, WithHeadings
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        $count = User::count();
        $skip = 1;
        $limit = $count - $skip; // the limit
        return User::select('id', 'name', 'email', 'mobile', 'gender', 'age', 'state', 'constituency', 'city', 'voter_id', 'member_before', 'approved', 'certificate', 'phone_verified_at')->skip($skip)->take($limit)->get();
    }

    public function headings() : array{
        return [
            'Id',
            'Name',
            'Email',
            'Mobile',
            'Gender',
            'Age',
            'State',
            'Constituency',
            'City',
            'Voter Id',
            'Member Before',
            'Approved',
            'Certificate',
            'Phone Verified At',
        ];
    }
}
