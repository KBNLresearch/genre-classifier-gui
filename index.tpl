<!DOCTYPE html>
<html>
<head>
    <title>Genre classifier</title>
    <meta charset="UTF-8">

    <style>
        * {margin: 0; padding: 0; border: 0;}
        body {font-family: helvetica, sans-serif; color: #333; overflow-y: scroll;}
        .header {width: 100%; border-bottom: 1px solid #eee; height: 70px; background-color: #fafafa;}
        .header h1 {float: left; line-height: 70px; margin: 0 10px 0 25px; font-size: 28px;}
        .header a {float: right; line-height: 70px; margin: 0 20px 0 0;}
        .bar {width: 30px; height: 30px; margin: 5px 0 20px 0;}
        .wrapper {width: 50%; float: left;}
        .input {padding: 50px 20px;}
        .output {padding: 50px 20px;}
        textarea {width: 96%; height: 535px; border: 1px solid #eee; resize: none; padding: 2%; font-size: 15px; border-radius: 5px;}
        .button {padding: 10px; font-size: 15px; border: 1px solid #eee; background-color: #fff; margin: 5px 0 0 0; border-radius: 5px;}
        .button:hover {background-color: #fafafa;}
    </style>
    <script type="text/javascript">
        % if not pred:
        window.onload = function(){
          document.forms['form'].submit()
        }
        % end

    </script>

</head>
<body>

    <div class="header">
        <h1>Genre classifier</h1>
        <a href="#">Lab</a>
        <a href="#">GitHub</a>
        <a href="#">Help</a>
    </div>

    <div class="wrapper">
    <div class="input">
        <form id="form" method="post" action="" enctype="multipart/form-data">
            % if not text:
            % text = 'Churchill, die jarenlang de eerste plaats innam onder de meest bewonderde mannen, doch deze het vorige jaar moest afstaan aan dr Drees, heeft kans gezien de eerste plaats weer te halen met een stijging in populariteit van vijf procent, terwijl dr Drees met een daling van vier procent weer op de tweede plaats kwam te staan. Dit is een van de resultaten van het onderzoek van het Nederlands Instituut voor de Publieke Opinie, dat onlangs alleen aan mannen over het gehele land verspreid en uit alle lagen van de bevolking de vraag stelde: Welke van alle nu levende mannen, leden van de koninklijke familie niet meegerekend, bewondert U het meest? Churchill kreeg vijftien procent van de „stommen", dr Drees 13, Eisenhower 6, Jan van Zutfen 6, Albert Schweitzer 3, Paus Pius XII 2, Adenauer 2, oud-rninifter Lieftinck 2, Einstein 1 en Abc Lenstra tenslotte ook 1 procent. Jan van Zutfen, Adenauer en Einstein komen dit jaar voor het eerst op de lijst van de meest bewonderde mannen voor. (ANP).'
            % end
            <textarea name="text">{{text}}</textarea>
            <input class="button" type="submit" value="Toon genre"><br>
        </form>
    </div>
    </div>

    <div class="wrapper">
    <div class="output">
        % if pred:
        % import math
        % colors = ["#edf8b1","#c7e9b4","#7fcdbb","#41b6c4","#1d91c0","#225ea8","#253494","#081d58"]
        % #colors = ["#a6cee3","#1f78b4","#b2df8a","#33a02c","#fb9a99","#e31a1c","#fdbf6f","#ff7f00","#cab2d6","#6a3d9a","#ffff99","#b15928"]
        % for i, p in enumerate(probs):
        <p>{{p}}: {{str(probs[p])[:6]}} <div class="bar" style="width: {{math.ceil(100 * probs[p])}}%; background-color: {{colors[-(i+1)]}}; transition: width 2s;"></div></p>
        % end
        % end
    </div>
    </div>

</body>
</html>
