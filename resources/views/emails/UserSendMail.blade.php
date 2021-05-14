@component('mail::message')
# Welcome, {{ $user->name }}

Thanku for creating an account on {{ config('app.name') }} Join App.Click the below button to login to website.

@component('mail::button', ['url' => config('app.url') ])
Login Here
@endcomponent

Thanks,<br>
{{ config('app.name') }}
@endcomponent
