// The Swift Programming Language
// https://docs.swift.org/swift-book

import Shaders

let vsh = VertexShader()
let bones = vsh.uniform(named: "bones", as: Mat4Array.self, arrayCapacity: 60)
let jointIndicies = vsh.input.geometry(0).jointIndicies
let jointWeights = vsh.input.geometry(0).jointWeights
var position = Vec4(vsh.input.geometry(0).position, 1)
position += bones[jointIndicies[0]] * position * jointWeights[0]
position += bones[jointIndicies[1]] * position * jointWeights[1]
position += bones[jointIndicies[2]] * position * jointWeights[2]
position += bones[jointIndicies[3]] * position * jointWeights[3]
vsh.output.position = vsh.modelViewProjectionMatrix * position

let fsh = FragmentShader()

let generator = GLSLCodeGenerator(version: .v300es)

do {
    _ = try generator.generateShaderCode(vertexShader: vsh, fragmentShader: fsh, attributes: [])
}catch{
    print(error)
}

print("Program End.")
