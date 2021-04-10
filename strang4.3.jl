### A Pluto.jl notebook ###
# v0.14.1

using Markdown
using InteractiveUtils

# ╔═╡ e78b6b56-94f8-11eb-34d4-29df9006d3d5
using LinearAlgebra

# ╔═╡ 9c04233a-77be-48dd-a8f4-f604001eb971
using Gadfly

# ╔═╡ 80792643-b721-403d-87aa-ea86dd132dcf
x_hat(A, b) = inv(A'*A)*A'*b

# ╔═╡ eae7d63a-23c0-4a1e-917a-775f6f1d0a58
p(A, b) = A * x_hat(A, b)

# ╔═╡ af023660-bf7a-4911-aeec-c183a9480207
P(A) = A * inv(A'*A)*A'

# ╔═╡ ebb013db-ec49-4e86-bd45-fee31e80ec5b
e(A, b) = b - p(A, b)

# ╔═╡ b9d1e491-fae6-454c-8c65-ecd12cb86c7b
vector_length(b) = sqrt(sum(b .^2))

# ╔═╡ cc2a1e91-431f-47f8-af69-f5604f4afdd2
md"""
``\newcommand\m[1]{\begin{bmatrix}#1\end{bmatrix}}``
"""

# ╔═╡ eb1169ca-99fc-4641-9442-4c236fb84849
md"""
## Q1
"""

# ╔═╡ 1ad66173-b95f-4e1e-8eef-81f066535073
q1b = [0 8 8 20]'

# ╔═╡ fa505d52-548b-4421-adc3-af1208aa1fe3
q1A = [
	1 0;
	1 1;
	1 3;
	1 4
]

# ╔═╡ 32d63aad-34e2-4e39-9ae0-b9a9a19b73bc
q1x_hat = round.(x_hat(q1A, q1b))

# ╔═╡ 5e289eee-0bfc-40b4-80bd-6dff581ee6a8
round.(p(q1A, q1b))

# ╔═╡ a5cd4a28-24a3-4ce9-bc64-5c0e22d2f76b
q1e = round.(e(q1A, q1b))

# ╔═╡ 6241971b-bbec-4d51-8ebc-bfe530f5da08
sum(e(q1A, q1b) .^ 2)

# ╔═╡ f00ed16c-903c-454f-a26c-b326f385dca0
md"""
## Q2

``C = 0``

``C + D = 8``

``C + 3D = 8``

``C + 4D = 20``
"""

# ╔═╡ 448cb2e0-42cf-4d30-8b4a-e72f2e5a5577
q2p = [1 5 13 17]'

# ╔═╡ 09c71489-2e1f-404e-9ed5-c156d5a5fe32
round.(x_hat(q1A, q2p))

# ╔═╡ 8736d67e-ba06-44f4-ae09-577cd9c4b3e5
md"""
## Q3
"""

# ╔═╡ 5662e9b5-fbf5-4c2b-a292-833837e1c6d6
q1e' * q1A

# ╔═╡ 5203c9f8-49d6-42de-ac55-6068196d0718
sqrt(sum(q1e .^ 2))

# ╔═╡ 1b853974-6f77-4a7e-8c38-e7ef1e2ae2b0
md"""
## Q4

``E = C^2 + (C + D - 8)^2 + (C + 3D - 8)^2 + (C + 4D - 20)^2``

``\frac{dE}{dC} = 0 = 2C + 2(C + D - 8) + 2(C + 3D - 8) + 2(C + 4D - 20) = 8C + 16D - 72 = 4C + 8D - 36``

``\frac{dE}{dd} = 0 = 2(C + D - 8) + 2*3(C + 3D - 8) + 2*4(C + 4D - 20) = 16C + 52 - 224 = 8C + 21 - 112``
"""

# ╔═╡ c8a602d3-7245-4d55-8094-e2b832308276
q1A' * q1A * q1x_hat

# ╔═╡ 7f122fb3-bce2-4b38-be86-98888ef5cfdd
md"""
## Q5
"""

# ╔═╡ 9e39a31c-cc38-4e80-bb89-9b1f9c04112a
q5A = [
	1;
	1;
	1;
	1
]

# ╔═╡ b8a872bf-d0f0-4dcd-a59e-c61134563547
x_hat(q5A, q1b)

# ╔═╡ 68622c8f-400d-4f84-ac1a-a71835fef077
q5e = e(q5A, q1b)

# ╔═╡ 827c4ddb-d1f6-4927-84ce-a77af1c09bb3
begin
	q5_line = layer(x = q1A[:,2], y = [9 9 9 9]', Geom.line)
	dots = layer(x = q1A[:,2], y=q1b, Geom.point)
	plot(q5_line, dots)
end

# ╔═╡ e61401fc-48a6-4330-893c-c6bed3dc1a09
md"""
## Q6
"""

# ╔═╡ 9f27d7e0-8d48-4097-80ad-28939361b6fc
q5e' * q5A

# ╔═╡ 60d1b8cb-a9c6-4245-a04b-0dacf9f3be49
vector_length(q5e)

# ╔═╡ 423efd79-a5df-4dee-b202-c3363b61c7d6
md"""
## Q7
"""

# ╔═╡ ae183393-c1f8-43a2-a87b-6c6415b9555e
q7A = [0 1 3 4]'

# ╔═╡ 6bafc965-e274-4c9f-87e4-a3c8309ea55b
q7x_hat = x_hat(q7A .// 1, q1b .// 1)

# ╔═╡ 0f077643-d348-4058-afd8-e86ad88d6b03
q7A .// 1

# ╔═╡ cc3fef95-a772-437e-8f9c-1c393b542c17
begin
	q7_line = layer(x = q7A, y = q7A * q7x_hat, Geom.line)
	plot(q7_line, dots)
end

# ╔═╡ 9c456667-5641-4031-8f9b-ee941a71c3ca
md"""
## Q8

``\m{1 & 1 & 1 & 1} \not\perp \m{0 & 1 & 3 & 4}``
"""

# ╔═╡ af79f8c7-08e3-45a8-8a1e-c4eb55658a96
md"""
## Q9
"""

# ╔═╡ 94f8c203-4ec6-4990-8e92-cbe1a443b3e1
q9A = [
	1 0 0^2;
	1 1 1^2;
	1 3 3^2;
	1 4 4^2
]

# ╔═╡ 76e828b7-681c-4e6a-b759-8597289fa9b2
q9x_hat = x_hat(q9A .// 1, q1b .// 1)

# ╔═╡ 5b7f5a7b-4bae-4c70-96b7-08905383a6fc
q9A' * q9A

# ╔═╡ 82d7eb89-2561-4e53-93c9-660079830f35
q9A' * q1b

# ╔═╡ 6a662690-23b4-41b3-9d50-63419469e336
begin
	q9_line = layer(x = q7A, y = q9A * q9x_hat, Geom.smooth(smoothing=0.9))
	plot(q9_line, dots)
end

# ╔═╡ f7318298-b065-41b1-b4b2-3c24df312c65
md"""
## Q10
"""

# ╔═╡ 3074534c-8555-43f3-8783-bf1d8bd58192
q10A = [
	1 0 0^2 0^3;
	1 1 1^2 1^3;
	1 3 3^2 3^3;
	1 4 4^2 4^3
]

# ╔═╡ 49fc0b47-03d6-46ec-933e-62ab24558dda
q10A' * q10A

# ╔═╡ d01d20bd-71fc-4286-b413-fb20b80428a7
q10A' * q1b

# ╔═╡ ecf61046-682c-423a-a347-ddccce29dbda
q10x_hat = x_hat(q10A .// 1, q1b .// 1)

# ╔═╡ 3767f025-3650-404d-8a20-138560fdc7db
begin
	q10_line = layer(x = q7A, y = q10A * q10x_hat, Geom.smooth(smoothing=0.9))
	plot(q10_line, dots)
end

# ╔═╡ 6efabba5-3eb6-4dd5-8ea9-e39c773b5e87
round.(p(q10A, q1b))

# ╔═╡ a706a8d6-07a9-4af6-8107-a90bbd8db4c8
round.(e(q10A, q1b))

# ╔═╡ be7510f2-6264-4f24-80e4-aab73ebfd8a4
md"""
## Q11
"""

# ╔═╡ 74731689-291b-4c88-ad11-5938b89280a8
q1x_hat' * [1 2]'

# ╔═╡ 32a0c363-f212-4b54-a78f-848ae9782231
md"""
The first equation is 

``Cm + D \sum{t_i} = \sum{b_i}``, if you divide by ``m``:

``C + D\hat{t} = \hat{b}``
"""

# ╔═╡ 038a76e4-56df-4faa-8dbc-2e58080f2dc5
md"""
## Q12

Where ``m`` is the length of ``A``

a)

``A^TA = \sum_i^m{1^2} = m``

``(A^TA)^{-1}A^T = \m{\frac{1}{m} & ... & \frac{1}{m}}``

``\hat{x} = (A^TA)^{-1}A^Tb = \frac{\sum_i^m{b_i*1}}{m}``

which is the mean!


b)

The definition of the variance:

``var(A) = \frac{\sum_i^m{(b_i - \hat{x})^2}}{m}``

From above:

``\hat{x} = (A^TA)^{-1}A^Tb = \frac{\sum_i^m{b_i*1}}{m}``

``b - A\hat{x} = \m{b_1 - \hat{x} & ... & b_m - \hat{x}} = e``

``||e||^2 = \frac{\sum_i^m{(b_i - \hat{x})^2}}{m}``

"""

# ╔═╡ 576f5697-d692-427c-b159-b652e8140176
q12b = [1 2 6]'

# ╔═╡ 4a1846e0-b74f-433f-8e27-d0ad605b79a7
q19p = [3 3 3]

# ╔═╡ fab00ef9-f4fb-4d15-b47a-1a043ef35ea1
q19A = [1 1 1]'

# ╔═╡ 6220b1ce-c76e-4d4c-ab0b-9b24777c0a62
q19e = e(q19A, q12b)

# ╔═╡ 70e49d4a-7d6d-4eea-b79e-a5c1e43befc6
q19p *q19e 

# ╔═╡ 66b7569a-3066-4d86-94e8-cbc52dab4dac
q19A * inv(q19A'*q19A)*q19A'

# ╔═╡ 842e9258-0a39-4284-a6a1-21b46021c044
md"""
## Q13

``(A^TA)^{-1}A^Te = (A^TA)^{-1}A^Tb - (A^TA)^{-1}A^TAx``
"""

# ╔═╡ 6209314d-17a4-40a6-b4a3-a79de798fb4c
md"""
## Q14

``(b - Ax)(b - Ax)^T = \sigma^2I``

``(A^TA)^{-1}A^T(b - Ax)(b - Ax)^TA(A^TA)^{-1} = (A^TA)^{-1}A^T\sigma^2IA(A^TA)^{-1}``

Distribute the transpose and multiply

``((A^TA)^{-1}A^Tb - (A^TA)^{-1}A^TAx)(b^TA(A^TA)^{-1} - x^TA^TA(A^TA)^{-1}) = \sigma^2(A^TA)^{-1}A^TA(A^TA)^{-1}``

Note that the transpose of a symmetric matrix ``(A^TA)^T`` is ``A^TA`` and so is it's inverse. Redistribute the transpose out of the second term

``(\hat{x} - x)((A^TA)^{-1}A^Tb - x)^T = \sigma^2A(A^TA)^{-1}``

``(\hat{x} - x)(\hat{x} - x) = \sigma^2A(A^TA)^{-1}``
"""

# ╔═╡ 4705a04f-5eb4-4555-938e-961163267c27
md"""
## Q15
"""

# ╔═╡ 2ad277f0-e350-41cd-937d-41d3b06813ef
q15A = [1 1 1 1]'

# ╔═╡ 1572e4aa-1320-4a27-9728-c1944e2e32ed
inv(q15A' * q15A)

# ╔═╡ f747be9a-9ebe-4bd2-a156-5084720e9943
md"""
## Q16

``\hat{x}_{10} = \frac{1}{10}b_{10} + y\hat{x}_9=\frac{1}{10}(b_1 + ... + b_{10})``

``y = \frac{1}{10}(b_1 + ... + b_9) * \frac{9}{(b_1 + ... + b_9)} = \frac{9}{10}``

"""

# ╔═╡ cda25a6e-8b19-40c3-b3af-4da68463950d
md"""
## Q17

``C + D(-1) = 7``

``C + D(1) = 7``

``C + D(2) = 21``
"""

# ╔═╡ 37a5d80b-da30-4e1c-bbdc-5aca36bbb863
q17A = [
	1 -1;
	1 1;
	1 2
]

# ╔═╡ a1f97cac-d9d3-44c8-b270-3552f039f211
q17b = [7 7 21]'

# ╔═╡ 151ff6f7-937f-477a-8bdf-64bbbfc0c396
x_hat(q17A, q17b)

# ╔═╡ e2234cb6-0251-4f1c-985c-596b51aae0ff
begin
	q17_line = layer(x = q17A[:,2], y = p(q17A, q17b), Geom.smooth(smoothing=0.9))
	q17_dots = layer(x = q17A[:,2], y = q17b, Geom.point)
	plot(q17_line, q17_dots)
end

# ╔═╡ 10826727-d308-4943-89de-b3ddda714cb7
md"""
## Q18
"""

# ╔═╡ 70302701-28d9-409c-8e16-77c38f96f149
q18e = e(q17A, q17b)

# ╔═╡ 43445a79-b47a-478f-9e81-86d7c5fb884a
P(q17A) * q18e # This occurs because the error term is the basis for the nullspace of P

# ╔═╡ 723d98b9-fa6b-4ead-af2c-707c840c3504
md"""
## Q19
"""

# ╔═╡ 43f1a084-272a-4117-9e4c-fe7defc33e8e
x_hat(q17A, q18e)
#b is perpendicular to col(A)

# ╔═╡ e009d2de-5298-4f26-9c2d-bb7aab90ca11
md"""
## Q20
"""

# ╔═╡ 73f5f655-7c17-4b7d-874d-111992b1f833
q20b = [5 13 17]'

# ╔═╡ 6cb92d85-c7fd-4d21-bef1-a88d818f3e8e
round.(x_hat(q17A, q20b))

# ╔═╡ 642c057e-6a95-46f3-9967-486683b9662c
e(q17A, q20b)

# b is in Col(A)

# ╔═╡ e89f5887-b780-48f5-995d-0ca9cdb0f5f1
md"""
## Q21

``p \in C(A)``

``\hat{x} \in C(A^T)``

``e \in N(A^T)``

``0 \in N(A)``
"""

# ╔═╡ 385e379d-cda2-4e59-82c1-b92e9ac01d02
md"""
## Q22
"""

# ╔═╡ 56ac1108-d090-40de-a44c-fc4de279538b
q22A = [
	1 -2;
	1 -1;
	1 0;
	1 1;
	1 2
]

# ╔═╡ 3ae5ae11-639c-4f8b-a49c-006cce159d07
q22b = [4 2 -1 0 0]'

# ╔═╡ 2c5483c0-5e24-4e87-9ab6-8a9da24fa193
x_hat(q22A, q22b)

# ╔═╡ 62a0aa20-8444-4a88-8a17-69a38df56328
md"""
## Q23

``e \perp \hat{x}``

Show:

``||e||^2 = e^Tb = b^Tb -p^Tb``

Recall that:

``b = p + e``

``||e||^2 = e^Te``

``e^Tb = e^T(e + p) = e^Te + e^Tp = e^Te = ||e||^2``

``e^Tb = (b - p)^Tb = b^Tb - p^Tb``

"""

# ╔═╡ 25053a0a-0e86-4413-8f48-d2bf99c382f3
md"""
## Q24

When is:

``\frac{\partial}{\partial x}||Ax-b||^2 = 0``?

Know:

``\frac{\partial}{\partial x}||Ax||^2 = 2A^TAx``

``\frac{\partial}{\partial x}2b^TAx = 2A^Tb``

``\frac{\partial}{\partial x}||Ax-b||^b = \frac{\partial}{\partial x}(Ax -b)^T(Ax - b) = \frac{\partial}{\partial x}(Ax)^TAx - (Ax)^Tb - b^T(Ax) + b^Tb``

``\frac{\partial}{\partial x}b^Tb = 0``

``\frac{\partial}{\partial x}(Ax)^TAx= \frac{\partial}{\partial x}||Ax||^2 = 2A^TAx``

``-\frac{\partial}{\partial x}((Ax)^Tb + b^T(Ax)) = ?``

Need to show that ``((Ax)^Tb + b^T(Ax)) = 2b^TAx``

``((Ax)^Tb + b^T(Ax))^T = ((Ax)^Tb + b^T(Ax))`` Meaning this is symmetric and 

``(Ax)^Tb = b^T(Ax)``

``-\frac{\partial}{\partial x}((Ax)^Tb + b^T(Ax)) = -\frac{\partial}{\partial x}2b^TAx= -2A^Tb``

So ``\frac{\partial}{\partial x}||Ax-b||^2 = 0``` when ``A^TAx = A^Tb``

Or when the normal equation is satisfied.
"""

# ╔═╡ b8fa4914-5601-4ee7-a70f-c83bd7319a4d
md"""
## Q25

Starting equations for ``i \in {1, 2, 3}``

``1 + Dt_i = b_i \rightarrow D = \frac{b_i -1}{t_i}``

``\frac{b_1 -1}{t_1} = \frac{b_2 -1}{t_2} = \frac{b_3 -1}{t_3}``

"""

# ╔═╡ 0eaabc59-e6b6-4ba8-8465-0a36d4f4931a
md"""
## Q26
"""

# ╔═╡ 04234098-5e0d-4776-a9df-ea03e9538378
q26A = [
	1 1 0;
	1 0 1;
	1 -1 0;
	1 0 -1
]

# ╔═╡ c44238c9-bd59-46a7-b424-323a07db96b3
q26b = [0 1 3 4]'

# ╔═╡ 9a1ea12a-6508-4361-8763-e47a59253a15
x_hat(q26A, q26b)

# ╔═╡ 03d27a8a-9d53-47ec-849d-cbc10173cc15
[1 0 0] * x_hat(q26A, q26b)

# ╔═╡ 8be98310-0026-4900-b5c7-4a5c9b20dda5
sum(q26b)/ length(q26b)

# ╔═╡ 7f10f5d4-f3dd-4adf-acff-6f90f047ec52
md"""
## Q27

I'm finding it easier to do this through calculus

``\min (x-y)^2+(x-3y)^2+(x+1)^2 = 2x^2 - 8xy +2x+10^2+1``

``\frac{\partial}{\partial x} 2x^2 - 8xy +2x+10^2+1 = 6x - 8y +2``

``\frac{\partial}{\partial y} 2x^2 - 8xy +2x+10^2+1 = 20y-8x``
"""

# ╔═╡ 42bddad5-4d0b-4967-9a92-3ef32318b29f
q27A = [
	6 -8;
	-8 20
]

# ╔═╡ a95df13c-7e5c-4437-b023-34a8970c9a86
q27b = [-2 0]'

# ╔═╡ 7d2918fb-ccff-4f49-a0dc-b33705915c9c
q27x_hat = inv(q27A .//1)*q27b .//1

# ╔═╡ dc0ef4a2-114a-42c4-a97c-f8a4c93bb2fd
begin
	q27x = q27x_hat[1]
	q27y = q27x_hat[2]
	q27e = (q27x - q27y)^2 + (q27x - 3*q27y)^2 + (q27x + 1)^2 
end

# This line is perpendicular to the two lines that the points lie on

# ╔═╡ 76f62c73-5c3f-45b2-9de2-1c92c5df2d3e
md"""
## Q28

Construct a matrix ``B`` from the pivot columns of ``A``.
"""

# ╔═╡ 57d67aad-141c-4ccb-9a45-a272fd8fa532
md"""
## Q29

There are infinitely many hyperplanes that intersect with the origin. The first is if the hyperplane is perpendicular to itself.

Less than that is needed. Any point that has linearly dependent components also has infinitely many hyperplanes intersecting with it.
"""

# ╔═╡ 6d4ba851-1705-4d00-9e2a-c0d0d0b9ab28
md"""
## Q30
"""

# ╔═╡ 64fa29fb-9bb9-433e-bb17-97d7d11192cb


# ╔═╡ Cell order:
# ╠═e78b6b56-94f8-11eb-34d4-29df9006d3d5
# ╠═9c04233a-77be-48dd-a8f4-f604001eb971
# ╠═80792643-b721-403d-87aa-ea86dd132dcf
# ╠═eae7d63a-23c0-4a1e-917a-775f6f1d0a58
# ╠═af023660-bf7a-4911-aeec-c183a9480207
# ╠═ebb013db-ec49-4e86-bd45-fee31e80ec5b
# ╠═b9d1e491-fae6-454c-8c65-ecd12cb86c7b
# ╠═cc2a1e91-431f-47f8-af69-f5604f4afdd2
# ╠═eb1169ca-99fc-4641-9442-4c236fb84849
# ╠═1ad66173-b95f-4e1e-8eef-81f066535073
# ╠═fa505d52-548b-4421-adc3-af1208aa1fe3
# ╠═32d63aad-34e2-4e39-9ae0-b9a9a19b73bc
# ╠═5e289eee-0bfc-40b4-80bd-6dff581ee6a8
# ╠═a5cd4a28-24a3-4ce9-bc64-5c0e22d2f76b
# ╠═6241971b-bbec-4d51-8ebc-bfe530f5da08
# ╠═f00ed16c-903c-454f-a26c-b326f385dca0
# ╠═448cb2e0-42cf-4d30-8b4a-e72f2e5a5577
# ╠═09c71489-2e1f-404e-9ed5-c156d5a5fe32
# ╠═8736d67e-ba06-44f4-ae09-577cd9c4b3e5
# ╠═5662e9b5-fbf5-4c2b-a292-833837e1c6d6
# ╠═5203c9f8-49d6-42de-ac55-6068196d0718
# ╠═1b853974-6f77-4a7e-8c38-e7ef1e2ae2b0
# ╠═c8a602d3-7245-4d55-8094-e2b832308276
# ╠═7f122fb3-bce2-4b38-be86-98888ef5cfdd
# ╠═9e39a31c-cc38-4e80-bb89-9b1f9c04112a
# ╠═b8a872bf-d0f0-4dcd-a59e-c61134563547
# ╠═68622c8f-400d-4f84-ac1a-a71835fef077
# ╠═827c4ddb-d1f6-4927-84ce-a77af1c09bb3
# ╠═e61401fc-48a6-4330-893c-c6bed3dc1a09
# ╠═9f27d7e0-8d48-4097-80ad-28939361b6fc
# ╠═60d1b8cb-a9c6-4245-a04b-0dacf9f3be49
# ╠═423efd79-a5df-4dee-b202-c3363b61c7d6
# ╠═ae183393-c1f8-43a2-a87b-6c6415b9555e
# ╠═6bafc965-e274-4c9f-87e4-a3c8309ea55b
# ╠═0f077643-d348-4058-afd8-e86ad88d6b03
# ╠═cc3fef95-a772-437e-8f9c-1c393b542c17
# ╠═9c456667-5641-4031-8f9b-ee941a71c3ca
# ╠═af79f8c7-08e3-45a8-8a1e-c4eb55658a96
# ╠═94f8c203-4ec6-4990-8e92-cbe1a443b3e1
# ╠═76e828b7-681c-4e6a-b759-8597289fa9b2
# ╠═5b7f5a7b-4bae-4c70-96b7-08905383a6fc
# ╠═82d7eb89-2561-4e53-93c9-660079830f35
# ╠═6a662690-23b4-41b3-9d50-63419469e336
# ╠═f7318298-b065-41b1-b4b2-3c24df312c65
# ╠═3074534c-8555-43f3-8783-bf1d8bd58192
# ╠═49fc0b47-03d6-46ec-933e-62ab24558dda
# ╠═d01d20bd-71fc-4286-b413-fb20b80428a7
# ╠═ecf61046-682c-423a-a347-ddccce29dbda
# ╠═3767f025-3650-404d-8a20-138560fdc7db
# ╠═6efabba5-3eb6-4dd5-8ea9-e39c773b5e87
# ╠═a706a8d6-07a9-4af6-8107-a90bbd8db4c8
# ╠═be7510f2-6264-4f24-80e4-aab73ebfd8a4
# ╠═74731689-291b-4c88-ad11-5938b89280a8
# ╠═32a0c363-f212-4b54-a78f-848ae9782231
# ╠═038a76e4-56df-4faa-8dbc-2e58080f2dc5
# ╠═576f5697-d692-427c-b159-b652e8140176
# ╠═4a1846e0-b74f-433f-8e27-d0ad605b79a7
# ╠═fab00ef9-f4fb-4d15-b47a-1a043ef35ea1
# ╠═6220b1ce-c76e-4d4c-ab0b-9b24777c0a62
# ╠═70e49d4a-7d6d-4eea-b79e-a5c1e43befc6
# ╠═66b7569a-3066-4d86-94e8-cbc52dab4dac
# ╠═842e9258-0a39-4284-a6a1-21b46021c044
# ╠═6209314d-17a4-40a6-b4a3-a79de798fb4c
# ╠═4705a04f-5eb4-4555-938e-961163267c27
# ╠═2ad277f0-e350-41cd-937d-41d3b06813ef
# ╠═1572e4aa-1320-4a27-9728-c1944e2e32ed
# ╠═f747be9a-9ebe-4bd2-a156-5084720e9943
# ╠═cda25a6e-8b19-40c3-b3af-4da68463950d
# ╠═37a5d80b-da30-4e1c-bbdc-5aca36bbb863
# ╠═a1f97cac-d9d3-44c8-b270-3552f039f211
# ╠═151ff6f7-937f-477a-8bdf-64bbbfc0c396
# ╠═e2234cb6-0251-4f1c-985c-596b51aae0ff
# ╠═10826727-d308-4943-89de-b3ddda714cb7
# ╠═70302701-28d9-409c-8e16-77c38f96f149
# ╠═43445a79-b47a-478f-9e81-86d7c5fb884a
# ╠═723d98b9-fa6b-4ead-af2c-707c840c3504
# ╠═43f1a084-272a-4117-9e4c-fe7defc33e8e
# ╠═e009d2de-5298-4f26-9c2d-bb7aab90ca11
# ╠═73f5f655-7c17-4b7d-874d-111992b1f833
# ╠═6cb92d85-c7fd-4d21-bef1-a88d818f3e8e
# ╠═642c057e-6a95-46f3-9967-486683b9662c
# ╠═e89f5887-b780-48f5-995d-0ca9cdb0f5f1
# ╠═385e379d-cda2-4e59-82c1-b92e9ac01d02
# ╠═56ac1108-d090-40de-a44c-fc4de279538b
# ╠═3ae5ae11-639c-4f8b-a49c-006cce159d07
# ╠═2c5483c0-5e24-4e87-9ab6-8a9da24fa193
# ╠═62a0aa20-8444-4a88-8a17-69a38df56328
# ╠═25053a0a-0e86-4413-8f48-d2bf99c382f3
# ╠═b8fa4914-5601-4ee7-a70f-c83bd7319a4d
# ╠═0eaabc59-e6b6-4ba8-8465-0a36d4f4931a
# ╠═04234098-5e0d-4776-a9df-ea03e9538378
# ╠═c44238c9-bd59-46a7-b424-323a07db96b3
# ╠═9a1ea12a-6508-4361-8763-e47a59253a15
# ╠═03d27a8a-9d53-47ec-849d-cbc10173cc15
# ╠═8be98310-0026-4900-b5c7-4a5c9b20dda5
# ╠═7f10f5d4-f3dd-4adf-acff-6f90f047ec52
# ╠═42bddad5-4d0b-4967-9a92-3ef32318b29f
# ╠═a95df13c-7e5c-4437-b023-34a8970c9a86
# ╠═7d2918fb-ccff-4f49-a0dc-b33705915c9c
# ╠═dc0ef4a2-114a-42c4-a97c-f8a4c93bb2fd
# ╠═76f62c73-5c3f-45b2-9de2-1c92c5df2d3e
# ╠═57d67aad-141c-4ccb-9a45-a272fd8fa532
# ╠═6d4ba851-1705-4d00-9e2a-c0d0d0b9ab28
# ╠═64fa29fb-9bb9-433e-bb17-97d7d11192cb
