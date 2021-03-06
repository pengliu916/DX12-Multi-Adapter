//--------------------------------------------------------------------------------------
// Copyright 2015 Intel Corporation
// All Rights Reserved
//
// Permission is granted to use, copy, distribute and prepare derivative works of this
// software for any purpose and without fee, provided, that the above copyright notice
// and this statement appear in all copies.  Intel makes no representations about the
// suitability of this software for any purpose.  THIS SOFTWARE IS PROVIDED "AS IS."
// INTEL SPECIFICALLY DISCLAIMS ALL WARRANTIES, EXPRESS OR IMPLIED, AND ALL LIABILITY,
// INCLUDING CONSEQUENTIAL AND OTHER INDIRECT DAMAGES, FOR THE USE OF THIS SOFTWARE,
// INCLUDING LIABILITY FOR INFRINGEMENT OF ANY PROPRIETARY RIGHTS, AND INCLUDING THE
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.  Intel does not
// assume any responsibility for any errors which may appear in this software nor any
// responsibility to update it.
//--------------------------------------------------------------------------------------

struct VertexShaderInput
{
	float4 position : POSITION;
	float2 uv : TEXCOORD;
};

struct PixelShaderInput
{
	float4 position : SV_POSITION;
	float2 uv : TEXCOORD;
};

cbuffer ConstantBufferTransform : register(b0)
{
	float4x4 modelViewProjection;
};

PixelShaderInput VShader(VertexShaderInput input, uint id : SV_VertexID)
{
	PixelShaderInput output;

	output.position = mul(modelViewProjection, input.position);
	output.uv = input.uv;

	return output;
}
