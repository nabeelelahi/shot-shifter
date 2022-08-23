<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>{{ $data->name }}</title>
   </head>
   <body>
      <table style="border-collapse: collapse; font-family: sans-serif; font-size: 14px; width: 100%;  margin: 0 auto;" >
         <tr>
            <td colspan="4">{{ date('m-d-Y, h:i A',strtotime($data->created_at)) }}</td>
            <td colspan="4" align="right">StudioBinder: Storyboard & Shot List</td>
         </tr>
         <tr >
            <td colspan="8" style="border-bottom:2px solid black; padding:20px 0;">{{ $data->name }} <span style="margin-left:10px;border: 1px solid grey ; border-radius: 10px; font-size: 10px !important; padding: 3px; background-color: rgb(243, 236, 236); ">{{ $data->total_scene }} SHOTS</span></td>
         </tr>
         <tr  style="border-bottom: 2px solid rgb(165, 165, 165); ">
            <th colspan="2"  style="text-align: right; padding: 30px 5px 3px 0; opacity: 0.8; " >SCENE </th>
            <th style="padding: 30px 0 3px 0; opacity: 0.8; ">SHOT</th>
            <th  style="text-align: left; padding: 30px 5px 5px 10px; opacity: 0.8; ">DESCRIPTION</th>
            <th  style="text-align: left ; padding: 30px 10px 3px 10px;  opacity: 0.8;">Sun Time</th>
            <th style="padding: 30px 5px 3px 0;  opacity: 0.8; ">CAMERA</th>
            <th style="padding: 30px 0 3px 0;  opacity: 0.8;">SHOT SIZE</th>
            <th style="padding: 30px 5px 3px 0;  opacity: 0.8; ">Location</th>
         </tr>
         @if( count($data->scenes) )
            @foreach( $data->scenes as $scenes )
                <tr style="border-bottom: 2px solid rgb(165, 165, 165);">
                    <td style="padding: 15px;">
                        @if( !empty($scenes->image_url) )
                            <img src="{{ public_path('storage/' . $scenes->image_url) }}" alt="{{ $scenes->title }}" style="width:200px;height:70px;object-fit:contain;">
                        @else
                            <img style="width:200px;height:70px;object-fit:contain;" src="{{ public_path('images/no-image-available.png') }}" alt="{{ $scenes->title }}">
                        @endif
                    </td>
                    <td style="text-align: right; padding: 15px;  opacity: 0.6;">{{ $scenes->scene_no }}</td>
                    <td style="text-align: right; padding: 15px;  opacity: 0.6;">{{ $loop->iteration }}</td>
                    <td style="padding: 15px;  opacity: 0.6;">{{ $scenes->description }}</td>
                    <td style="padding: 15px;  opacity: 0.6;">{{ $scenes->sun_time }}</td>
                    <td style="padding: 15px;  opacity: 0.6;">{{ $scenes->camera }}</td>
                    <td style="text-align: center; padding: 15px;  opacity: 0.6;">{{ $scenes->size }}</td>
                    <td style="padding: 15px; text-align: center;  opacity: 0.6;">{{ $scenes->location }}</td>
                </tr>
            @endforeach
         @else
            <tr>
                <td colspan="8">No Scene Found</td>
            </tr>
         @endif

         <tr style="border-bottom: 2px solid rgb(165, 165, 165);">
            <td colspan="8" style="text-align: center; padding: 30px;background-color: rgb(39, 39, 39); color: aliceblue;"  >End of Setup 1 of 1— Exterior Car</td>
         </tr>
      </table>
   </body>
</html>
