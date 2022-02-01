<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>pdf document</title>
    <style>
        @font-face { font-family: gilroy-medium;
			 src: url(./Gilroy-Medium.ttf); }
        @font-face { font-family: gilroy-semiBold;
             src: url(./Gilroy-SemiBold.ttf); }
    </style>
</head>
<body>
    <div class="main-container" style="margin: auto;background: rgb(25,28,44);">
        @if( !empty($data) )
            @if( count($data->scenes) )
                @foreach( $data->scenes as $scenes )
                    <div class="sec-one" style="padding: 30px;">
                        <div class="image-container" >
                            @if( !empty($scenes->image_url) )
                                <img style="width: 100%;height: 500px;" src="{{ public_path('storage/' . $scenes->image_url) }}" alt="{{ $scenes->title }}">
                            @else
                                <img style="width: 100%;height: 500px;" src="{{ public_path('images/no-image-available.png') }}" alt="{{ $scenes->title }}">
                            @endif
                        </div>
                        <div class="description" style="text-align:center;" >
                            <h1 style="color:rgb(255,255,255);font-family: gilroy-semiBold;"> <span style="font-size: 26px;border-radius: 100%;background: #2AF1FE;padding: 0px 8px;color:rgb(0,0,0);">{{ $loop->iteration }}</span>{{ $scenes->title }}</h1>
                            <p style="color: #A3A4AA;font-size: 20px;font-family: gilroy-medium;text-align:left;page-break-before: always;">{{ $scenes->description }}</p>
                        </div>
                        <table style="width: 100%;">
                        <tbody>
                            <tr>
                                <td>
                                    <p style="font-family: gilroy-semiBold;color: rgb(42,241,254);font-size: 20px;text-transform: uppercase;margin-bottom: 10px;">Size</p>
                                    <p style="font-family: gilroy-medium;font-family: gilroy-medium;font-family: gilroy-medium;font-family: gilroy-medium;color: rgb(255,255,255);font-size: 20px;text-transform: uppercase;margin-top: 10px;">{{ $scenes->size }}</p>
                                </td>
                                <td>
                                    <p style="font-family: gilroy-semiBold;color: rgb(42,241,254);font-size: 20px;text-transform: uppercase;margin-bottom: 10px;">Angle</p>
                                    <p style="font-family: gilroy-medium;font-family: gilroy-medium;font-family: gilroy-medium;font-family: gilroy-medium;color: rgb(255,255,255);font-size: 20px;text-transform: uppercase;margin-top: 10px;">{{ $scenes->angle }}</p>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-bottom: 20px;">
                                    <p style="font-family: gilroy-semiBold;color: rgb(42,241,254);font-size: 20px;text-transform: uppercase;margin-bottom: 10px;">Lens</p>
                                    <p style="font-family: gilroy-medium;font-family: gilroy-medium;font-family: gilroy-medium;font-family: gilroy-medium;color: rgb(255,255,255);font-size: 20px;text-transform: uppercase;margin-top: 10px;">{{ $scenes->lens }}</p>
                                </td>
                            </tr>
                            <tr>
                                <td colspan=2 style="border: 0px;border-bottom: 2px solid rgb(49,53,75);">
                            </tr>
                            <tr>
                                <td style="padding-top: 20px;">
                                    <p style="font-family: gilroy-semiBold;color: rgb(42,241,254);font-size: 20px;text-transform: uppercase;margin-bottom: 10px;">Internal / External</p>
                                    <p style="font-family: gilroy-medium;font-family: gilroy-medium;font-family: gilroy-medium;font-family: gilroy-medium;color: rgb(255,255,255);font-size: 20px;text-transform: uppercase;margin-top: 10px;">{{ $scenes->internal_external }}</p>
                                </td>
                                <td style="padding-top: 20px;">
                                    <p style="font-family: gilroy-semiBold;color: rgb(42,241,254);font-size: 20px;text-transform: uppercase;margin-bottom: 10px;">Location</p>
                                    <p style="font-family: gilroy-medium;font-family: gilroy-medium;font-family: gilroy-medium;font-family: gilroy-medium;color: rgb(255,255,255);font-size: 20px;text-transform: uppercase;margin-top: 10px;">{{ $scenes->location }}</p>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p style="font-family: gilroy-semiBold;color: rgb(42,241,254);font-size: 20px;text-transform: uppercase;margin-bottom: 10px;">Sun Time</p>
                                    <p style="font-family: gilroy-medium;font-family: gilroy-medium;font-family: gilroy-medium;color: rgb(255,255,255);font-size: 20px;text-transform: uppercase;margin-top: 10px;">{{ $scenes->sun_time }}</p>
                                </td>
                                <td>
                                    <p style="font-family: gilroy-semiBold;color: rgb(42,241,254);font-size: 20px;text-transform: uppercase;margin-bottom: 10px;">Location Pin</p>
                                    <p style="font-family: gilroy-medium;font-family: gilroy-medium;font-family: gilroy-medium;color: rgb(255,255,255);font-size: 20px;text-transform: uppercase;margin-top: 10px;">{{ $scenes->location_pin }}</p>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p style="font-family: gilroy-semiBold;color: rgb(42,241,254);font-size: 20px;text-transform: uppercase;margin-bottom: 10px;">Cast</p>
                                    <p style="font-family: gilroy-medium;font-family: gilroy-medium;font-family: gilroy-medium;color: rgb(255,255,255);font-size: 20px;text-transform: uppercase;margin-top: 10px;">{{ $scenes->cast }}</p>
                                </td>
                                <td>
                                    <p style="font-family: gilroy-semiBold;color: rgb(42,241,254);font-size: 20px;text-transform: uppercase;margin-bottom: 10px;">Wardrobe</p>
                                    <p style="font-family: gilroy-medium;font-family: gilroy-medium;font-family: gilroy-medium;color: rgb(255,255,255);font-size: 20px;text-transform: uppercase;margin-top: 10px;">{{ $scenes->wardrobe }}</p>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p style="font-family: gilroy-semiBold;color: rgb(42,241,254);font-size: 20px;text-transform: uppercase;margin-bottom: 10px;">Props</p>
                                    <p style="font-family: gilroy-medium;font-family: gilroy-medium;color: rgb(255,255,255);font-size: 20px;text-transform: uppercase;margin-top: 10px;">{{ $scenes->props }} </p>
                                </td>
                                <td>
                                    <p style="font-family: gilroy-semiBold;color: rgb(42,241,254);font-size: 20px;text-transform: uppercase;margin-bottom: 10px;">Action</p>
                                    <p style="font-family: gilroy-medium;font-family: gilroy-medium;color: rgb(255,255,255);font-size: 20px;text-transform: uppercase;margin-top: 10px;">{{ $scenes->action }}</p>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p style="font-family: gilroy-semiBold;color: rgb(42,241,254);font-size: 20px;text-transform: uppercase;margin-bottom: 10px;">Speed</p>
                                    <p style="font-family: gilroy-medium;font-family: gilroy-medium;color: rgb(255,255,255);font-size: 20px;text-transform: uppercase;margin-top: 10px;">{{ $scenes->speed }} </p>
                                </td>
                                <td>
                                    <p style="font-family: gilroy-semiBold;color: rgb(42,241,254);font-size: 20px;text-transform: uppercase;margin-bottom: 10px;">Sound</p>
                                    <p style="font-family: gilroy-medium;font-family: gilroy-medium;color: rgb(255,255,255);font-size: 20px;text-transform: uppercase;margin-top: 10px;">{{ $scenes->sound }}</p>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p style="font-family: gilroy-semiBold;color: rgb(42,241,254);font-size: 20px;text-transform: uppercase;margin-bottom: 10px;">Grip</p>
                                    <p style="font-family: gilroy-medium;font-family: gilroy-medium;color: rgb(255,255,255);font-size: 20px;text-transform: uppercase;margin-top: 10px;">{{ $scenes->grip }} </p>
                                </td>
                                <td>
                                    <p style="font-family: gilroy-semiBold;color: rgb(42,241,254);font-size: 20px;text-transform: uppercase;margin-bottom: 10px;">Time Picker</p>
                                    <p style="font-family: gilroy-medium;font-family: gilroy-medium;color: rgb(255,255,255);font-size: 20px;text-transform: uppercase;margin-top: 10px;">{{ $scenes->timepicker }} </p>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p style="font-family: gilroy-semiBold;color: rgb(42,241,254);font-size: 20px;text-transform: uppercase;margin-bottom: 10px;">Lines & Dialogue English</p>
                                    <p style="font-family: gilroy-medium;color: rgb(255,255,255);font-size: 20px;text-transform: uppercase;margin-top: 10px;">{{ $scenes->lines_dialogue_english }}</p>
                                </td>
                                <td>
                                    <p style="font-family: gilroy-semiBold;color: rgb(42,241,254);font-size: 20px;text-transform: uppercase;margin-bottom: 10px;">Lines & Dialogue Foreign</p>
                                    <p style="font-family: gilroy-medium;color: rgb(255,255,255);font-size: 20px;text-transform: uppercase;margin-top: 10px;">{{ $scenes->lines_dialogue_foreign }}</p>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p style="font-family: gilroy-semiBold;color: rgb(42,241,254);font-size: 20px;text-transform: uppercase;margin-bottom: 10px;">Camera</p>
                                    <p style="font-family: gilroy-medium;color: rgb(255,255,255);font-size: 20px;text-transform: uppercase;margin-top: 10px;">{{ $scenes->camera }}</p>
                                </td>
                                <td> </td>
                            </tr>
                        </tbody>
                        </table>
                    </div>
                    @if( count($scenes->breaks) )
                        @foreach( $scenes->breaks as $breaks )
                            <div>
                                <div style="height:20px; background-color: #2a2e43;"></div>
                                    <div style="background-image:url('{{ public_path('admin/assets/img/newsecbreak.png')}});
                                    background-repeat: no-repeat;
                                    background-size: cover;
                                    text-align:center;" >
                                        <h1 style="font-family: gilroy-semiBold;color: rgb(255,255,255);padding:50px;margin: 0px;text-transform: uppercase;">{{ $breaks->name }}</h1>
                                    </div>
                                <div style="height:20px; background-color: #2a2e43;margin-top: -4px;"></div>
                            </div>
                        @endforeach
                    @endif
                @endforeach
            @endif
        @endif
    </div>
</body>
</html>
