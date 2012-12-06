fnServerObjectToArray = function ( aElements )
{
    return function ( sSource, aoData, fnCallback ) {
        $.ajax( {
            "dataType": 'json', 
            "type": "POST", 
            "url": sSource, 
            "data": aoData, 
            "success": function (json) {
                var a = [];
                for ( var i=0, iLen=json.aaData.length ; i<iLen ; i++ ) {
                    var inner = [];
                    for ( var j=0, jLen=aElements.length ; j<jLen ; j++ ) {
                        inner.push( json.aaData[i][aElements[j]] );
                    }
                    a.push( inner );
                }
                json.aaData = a;
                fnCallback(json);
            }
        } );
    }
}
