Shader "TextureBake/FractalNoiseUnwrap"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        Blend SrcAlpha OneMinusSrcAlpha 

        LOD 100

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            // make fog work
            #pragma multi_compile_fog

            #include "UnityCG.cginc"
            #include "fbm.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float4 uv : TEXCOORD0;
            };

            struct v2f
            {
                float4 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            sampler2D _MainTex;
            float4 _MainTex_ST;

            v2f vert (appdata v)
            {
                v2f o;
                v.vertex = float4(v.uv.xy, 0.0, 1.0);
                o.vertex = mul(UNITY_MATRIX_P, v.vertex);
                //o.vertex = UnityObjectToClipPos(v.vertex);

                o.uv = v.uv;
                return o;
            }
            
            fixed4 frag (v2f IN) : SV_Target
            {
              //here is where you would put the shader code you want to bake
              //for now I will just do a noise
              float f = fbm(IN.uv + fbm(5*IN.uv, 4), 4);
              fixed4 color = fixed4(f,f,1,1);
              return color;
            }
            ENDCG
        }
    }
}